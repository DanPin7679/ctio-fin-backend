import { BubbleController } from "chart.js";
import "./style.css";

const ctx = document.getElementById("myChart");
const ctx2 = document.getElementById("myChart2");

// const newData = [
//   50000, 51000, 54000, 60000, 61000, 64000, 70000, 71000, 74000, 80000, 81000,
//   84000,
// ];
// const newLabel = [
//   2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034,
// ];
const counter = (n) => {
  const newDiv = document.createElement("div");
  newDiv.style.display = "grid";
  newDiv.style.gridTemplateColumns = "1fr 2fr 1fr";
  newDiv.style.gap = "5px";

  const minus = document.createElement("button");
  minus.addEventListener("click", () => {
    n -= 1;
  });
  minus.innerHTML = "-";
  const plus = document.createElement("button");
  plus.addEventListener("click", () => {
    n += 1;
  });
  plus.innerHTML = "+";
  newDiv.appendChild(minus);
  newDiv.appendChild(plus);

  return newDiv;
};

function removeAllChildNodes(parent) {
  while (parent.firstChild) {
    parent.removeChild(parent.firstChild);
  }
}
const form = `
<form id="scen" method="post">
  <div style="display: flex; flex-direction: column; justify-content: flex-start; margin: 20px; gap: 10px;">
    
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" />
    
      <label for="lastname">Lastname:</label>
      <input type="text" id="lastname" name="LastName" />
    

      <label for="age">Age</label>
      <input type="number" id="age" name="age"></input>
   
      <label for="salary">Salary</label>
      <input type="number" id="salary" name="salary"></input>

    <div class="button">
        <button type="submit">Calculate</button>
    </div>

  </ul>
</form>

`;

var dataModel = {
  name: "",
  LastName: "",
  age: 0,
  salary: 0,
  contribution: 7,
};

async function postData(url = "", data = {}) {
  // Default options are marked with *
  const response = await fetch(url, {
    method: "POST", // *GET, POST, PUT, DELETE, etc.
    mode: "cors", // no-cors, *cors, same-origin
    cache: "no-cache", // *default, no-cache, reload, force-cache, only-if-cached
    credentials: "same-origin", // include, *same-origin, omit
    headers: {
      "Content-Type": "application/json",
      // 'Content-Type': 'application/x-www-form-urlencoded',
    },
    redirect: "follow", // manual, *follow, error
    referrerPolicy: "no-referrer", // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
    body: JSON.stringify(data), // body data type must match "Content-Type" header
  });
  return response.json(); // parses JSON response into native JavaScript objects
}

const createForm = () => {
  let newForm = document.createElement("div");
  newForm.innerHTML = form;
  let scenForm = document.getElementById("scen-form");
  scenForm.appendChild(newForm);

  let scen = document.getElementById("scen");
  scen.addEventListener("submit", (e) => {
    e.preventDefault();

    dataModel.name = e.target[0].value;
    dataModel.LastName = e.target[1].value;
    dataModel.age = Number(e.target[2].value);
    dataModel.salary = Number(e.target[3].value);

    console.log(dataModel);
    postData("http://127.0.0.1:3000/postCalcResults", dataModel).then(
      (data) => {
        console.log(data);
        myChart.destroy();
        myChart2.destroy();
        createChart2(data.ages, data.spends, data.cots);
        createChart(data.ages, data.assets);
      }
    );
  });
};
createForm();

const createChart = (newLabel, assets) => {
  let myChart = new Chart(ctx, {
    type: "line",
    data: {
      labels: newLabel,
      datasets: [
        {
          label: "Assets",
          data: assets,
          backgroundColor: "blue",
          borderWidth: 1,
        },
      ],
    },
    options: {},
  });

  return myChart;
};
var myChart = createChart([], []);

const createChart2 = (newLabel, sals, cots) => {
  let myChart2 = new Chart(ctx2, {
    type: "bar",
    data: {
      labels: newLabel,
      datasets: [
        {
          label: "Salary",
          data: sals,
          backgroundColor: "blue",
          borderWidth: 1,
        },
        {
          label: "Saving",
          data: cots,
          backgroundColor: "red",
          borderWidth: 1,
        },
      ],
    },
    options: {
      scales: {
        x: {
          stacked: true,
        },
        y: {
          stacked: true,
        },
      },
    },
  });

  return myChart2;
};
var myChart2 = createChart2([], []);

const replaceForm = (age, salary) => {
  const ageCounter = counter(age);
};
