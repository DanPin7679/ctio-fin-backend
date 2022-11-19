echo "Enter: 1 for ActLib; 2 Backend; 3 Fontend"
read CHOICE

if [ $CHOICE -eq 1 ] 
then
  cd actlib
  dune build
else
  if [ $CHOICE -eq 2 ] 
  then
    cd backend
    node ./index.js
  else
    ./actlib/_build/default/bin/main.exe '{"name": "Dany"}'
  fi
fi