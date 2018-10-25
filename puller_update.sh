#!/bin/bash
RESTORE=$(echo '\033[0m')
GREEN=$(echo '\033[00;32m')
LRED=$(echo '\033[01;31m')
LGREEN=$(echo '\033[01;32m')

#wait puller process to close
sleep 1
echo ${GREEN}"Puller début de la mise à jour.\n"${RESTORE}

#Check if git is installed
git --version >/dev/null 2>&1 || { echo ${LRED}Arrêt de l\'installation :${RESTORE} git n\'est pas installé.; exit 1; }

echo "1 -> Telechargement en cours...";

git clone https://github.com/ghazette/puller_binary.git $HOME/.puller_binary >/dev/null 2>&1

#check if the cloned git directory exists
if [ -f "$HOME/.puller_binary/puller" ];
then
  echo ${LGREEN}"2 -> Client téléchargé avec succès."${RESTORE};
else
  echo ${LRED}"2 -> Le téléchargement a échoué (doits insuffissants ?)."${RESTORE};
  exit 1;
fi

rm "$HOME/.puller/puller"
mv "$HOME/.puller_binary/puller" "$HOME/.puller/puller"
rm -rf "$HOME/.puller_binary"

echo ${GREEN}"\nMise à jour du client terminé."${RESTORE};
