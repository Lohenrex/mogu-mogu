const pictureInput = document.querySelector('#recipe_picture');
const stepsVideoInput = document.querySelector('#recipe_steps_video');
const ingredientAdder = document.querySelector('#ingredient_adder');
const applianceAdder = document.querySelector('#appliance_adder');
const ingredientSelect = document.querySelector("#recipe_ingredient_select");
const ingredientAmount = document.querySelector("#recipe_ingredient_amount");
const ingredientMeasure = document.querySelector("#recipe_ingredient_measure");
const applianceInput = document.querySelector("#recipe_appliance");
const theForm = document.querySelector("#recipesForm");

let selectedIngredients = [];
let selectedAppliances = [];

pictureInput.onchange = () => {
  if (pictureInput.files.length > 0) {
    const fileName = pictureInput.parentNode.querySelector(".file-name");
    fileName.textContent = pictureInput.files[0].name;
  }
}

stepsVideoInput.onchange = () => {
  if (stepsVideoInput.files.length > 0) {
    const fileName = stepsVideoInput.parentNode.querySelector(".file-name");
    fileName.textContent = stepsVideoInput.files[0].name;
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

theForm.addEventListener("submit", (e) => {
  let ingredientJson = JSON.stringify({needed: selectedIngredients});
  document.querySelector("#recipe_ingredients").value = ingredientJson;  
  document.querySelector("#recipe_appliances").value = selectedAppliances;
  return true;
});

const appendIngredientToArray = () => {
  let newIngredient = {name:ingredientSelect.value, quantity:ingredientAmount.value, measure:ingredientMeasure.value };
  selectedIngredients.push(newIngredient);  
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