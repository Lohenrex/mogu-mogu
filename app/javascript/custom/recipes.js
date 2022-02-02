const fileInput = document.querySelector('.file input[type=file]');
const ingredientAdder = document.querySelector('#ingredient_adder');
const applianceAdder = document.querySelector('#appliance_adder');

var selectedIngredients = [];
var selectedAppliances = [];

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
  let ingredientSelect = document.querySelector("#recipe_ingredient_select");
  let ingredientAmount = document.querySelector("#recipe_ingredient_amount");
  let ingredientMeasure = document.querySelector("#recipe_ingredient_measure");
  let newIngredient = `{ "${ingredientSelect.value}": {"quantity": ${ingredientAmount.value}, "measure": "${ingredientMeasure.value}"} }`;

  selectedIngredients.push(newIngredient);
  console.log(selectedIngredients);
  document.querySelector("#recipe_ingredients").value = selectedIngredients;
}

const appendIngredientToView = () => {
  let ingredientSelect = document.querySelector("#recipe_ingredient_select");
  let ingredientAmount = document.querySelector("#recipe_ingredient_amount");
  let ingredientMeasure = document.querySelector("#recipe_ingredient_measure");

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
  let applianceInput = document.querySelector("#recipe_appliance");
  let newAppliance = applianceInput.value;

  selectedAppliances.push(newAppliance);
  console.log(selectedAppliances);
  document.querySelector("#recipe_appliances").value = selectedAppliances;
}

const appendApplianceToView = () => {
  let applianceInput = document.querySelector("#recipe_appliance");

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