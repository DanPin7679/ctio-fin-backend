function createInfosCard(datas) {
  console.log(datas)
  var demo = document.getElementById('demo-infos');
  demo.innerHTML = datas.demographic.firstname
}

export function getMemberInfos(url) {
  (async () => {
      const data = await fetch(url ,{
          method:'GET',
      })
      .then((response) => response.json())
      .then((data) => {
        createInfosCard(data);
      })
  })();
}