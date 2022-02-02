const fileInput = document.querySelector('.file input[type=file]');
const ingredientAdder = document.querySelector('#ingredient_adder');
const applianceAdder = document.querySelector('#appliance_adder');
const ingredientSelect = document.querySelector("#recipe_ingredient_select");
const ingredientAmount = document.querySelector("#recipe_ingredient_amount");
const ingredientMeasure = document.querySelector("#recipe_ingredient_measure");
const applianceInput = document.querySelector("#recipe_appliance");

let selectedIngredients = [];
let selectedAppliances = [];

fileInput.onchange = () => {
  if (fileInput.files.length > 0) {
    const fileName = document.querySelector('.file .file-name');
    fileName.textContent = fileInput.files[0].name;
  }
}

ingredientAdder.addEventListener("click", (e) => {
  appendIngredientToArray();
  appendIngredientToView();
});

applianceAdder.addEventListener("click", (e) => {
  appendApplianceToArray();
  appendApplianceToView();
});

const appendIngredientToArray = () => {
  let newIngredient = `{ "${ingredientSelect.value}": {"quantity": ${ingredientAmount.value}, "measure": "${ingredientMeasure.value}"} }`;

  selectedIngredients.push(newIngredient);
  document.querySelector("#recipe_ingredients").value = selectedIngredients;
}

const appendIngredientToView = () => {
  let spanNode = document.createElement("span");
  let innerText = document.createTextNode(`${ingredientSelect.value} ${ingredientAmount.value} ${ingredientMeasure.value}`);
  let deleteButton = document.createElement("button");

  deleteButton.setAttribute("type", "button");
  deleteButton.setAttribute("id", `${ingredientSelect.value}_deleter`);
  deleteButton.classList.add("delete", "is-small", "ingredientDeleter");

  spanNode.classList.add("tag", "is-success", "is-light", "box", "active-ingredient");
  spanNode.appendChild(innerText);
  spanNode.appendChild(deleteButton);

  document.getElementById("ingredient_pool").appendChild(spanNode);
}

const appendApplianceToArray = () => {
  let newAppliance = applianceInput.value;
  selectedAppliances.push(newAppliance);
  document.querySelector("#recipe_appliances").value = selectedAppliances;
}

const appendApplianceToView = () => {
  let spanNode = document.createElement("span");
  let innerText = document.createTextNode(applianceInput.value);
  let deleteButton = document.createElement("button");

  deleteButton.setAttribute("type", "button");
  deleteButton.setAttribute("id", `${applianceInput.value}_deleter`);
  deleteButton.classList.add("delete", "is-small", "applianceDeleter");

  spanNode.classList.add("tag", "is-success", "is-light", "box", "active-appliance");
  spanNode.appendChild(innerText);
  spanNode.appendChild(deleteButton);

  document.getElementById("appliance_pool").appendChild(spanNode);
}