const backColor = [
  'rgb(255, 99, 132)',
  'rgb(54, 162, 235)',
  'rgb(255, 159, 64)',
  'rgb(153, 102, 255)',
  'rgb(255, 205, 86)',
  'rgb(75, 192, 192)',
  'rgb(201, 203, 207)'
]
const bColor = [
  'rgb(255, 99, 132)',
  'rgb(255, 159, 64)',
  'rgb(255, 205, 86)',
  'rgb(75, 192, 192)',
  'rgb(54, 162, 235)',
  'rgb(153, 102, 255)',
  'rgb(201, 203, 207)'
]

const mapData = (data) => {
  return {
    label: data.revtype,
    backgroundColor: backColor[data.id],
    borderColor: bColor[data.id],
    data: data.revenues,
  }
}

const createChart = (datas) => {
  const labels = datas.years;
  
  const data = {
    labels: labels,
    datasets: datas.revenues.map(mapData)
  };
  
  const config = {
    type: 'bar',
    data: data,
    options: {
      scales: {
        x: {
          stacked: true,
        },
        y: {
          stacked: true
        }
      }
    }
  };

  const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
} 

export const createScen = (url) => {
  fetch(url, {
  method: 'POST', // or 'PUT'
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({name:"DanPinJS"}),
})
  .then((response) => response.json())
  .then((data) => {
    console.log('Success:', data);
    console.log(data)
  })
  .catch((error) => {
    console.error('Error:', error);
  });
}



