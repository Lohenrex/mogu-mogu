document.addEventListener("turbo:load", () => {
  const pictureInput = document.querySelector('#recipe_picture');
  const stepsVideoInput = document.querySelector('#recipe_steps_video');
  const ingredientAdder = document.querySelector('#ingredient_adder');
  const applianceAdder = document.querySelector('#appliance_adder');
  const ingredientsInput = document.querySelector("#recipe_ingredients");
  const appliancesInput = document.querySelector("#recipe_appliances");
  const ingredientSelect = document.querySelector("#recipe_ingredient_select");
  const ingredientAmount = document.querySelector("#recipe_ingredient_amount");
  const ingredientMeasure = document.querySelector("#recipe_ingredient_measure");
  const applianceSelector = document.querySelector("#recipe_appliance_selector");
  const isEditPath = document.querySelector("#current_recipe_path");
  const theForm = document.querySelector("#recipesForm");
  let selectedIngredients = [];
  let selectedAppliances = [];

  const appendIngredientToArray = (newName, newAmount, newMeasure) => {
    let newIngredient = {name:newName, quantity:newAmount, measure:newMeasure };
    selectedIngredients.push(newIngredient);  
  }

  const appendApplianceToArray = (newAppliance) => { selectedAppliances.push(newAppliance); }

  const loadAppliances = () => {
    currentAppliances.forEach(applianceName => { 
      appendApplianceToArray(applianceName);
      appendApplianceToView(applianceName);
    });
  }

  const loadIngredients = () => {
    let parsedCurrentIngredients = JSON.parse(currentIngredients);

    parsedCurrentIngredients.needed.forEach(ingredient => {
      appendIngredientToArray(ingredient.name, ingredient.quantity, ingredient.measure);
      appendIngredientToView(ingredient.name, ingredient.quantity, ingredient.measure);
    });
  }

  const appendApplianceToView = (newAppliance) => {
    let spanNode = document.createElement("span");
    let innerText = document.createTextNode(newAppliance);
    let deleteButton = document.createElement("button");

    deleteButton.setAttribute("type", "button");
    deleteButton.setAttribute("id", `${newAppliance}_deleter`);
    deleteButton.classList.add("delete", "is-small", "appliance-deleter");

    spanNode.classList.add("tag", "is-success", "is-light", "box", "active-appliance");
    spanNode.appendChild(innerText);
    spanNode.appendChild(deleteButton);

    document.getElementById("appliance_pool").appendChild(spanNode);
  }

  const appendIngredientToView = (newName, newAmount, newMeasure) => {
    let spanNode = document.createElement("span");
    let innerText = document.createTextNode(`${newName} ${newAmount} ${newMeasure}`);
    let deleteButton = document.createElement("button");

    deleteButton.setAttribute("type", "button");
    deleteButton.setAttribute("id", `${newName}_deleter`);
    deleteButton.classList.add("delete", "is-small", "ingredient-deleter");

    spanNode.classList.add("tag", "is-success", "is-light", "box", "active-ingredient");
    spanNode.appendChild(innerText);
    spanNode.appendChild(deleteButton);

    document.getElementById("ingredient_pool").appendChild(spanNode);
  }
  if (pictureInput) {
    pictureInput.onchange = () => {
      if (pictureInput.files.length > 0) {
        const fileName = pictureInput.parentNode.querySelector(".file-name");
        fileName.textContent = pictureInput.files[0].name;
      }
    }
  }

  if (stepsVideoInput) {
    stepsVideoInput.onchange = () => {
      if (stepsVideoInput.files.length > 0) {
        const fileName = stepsVideoInput.parentNode.querySelector(".file-name");
        fileName.textContent = stepsVideoInput.files[0].name;
      }
    }
  }

  if (ingredientAdder) {
    ingredientAdder.addEventListener("click", (e) => {
      appendIngredientToArray(ingredientSelect.value, ingredientAmount.value, ingredientMeasure.value);
      appendIngredientToView(ingredientSelect.value, ingredientAmount.value, ingredientMeasure.value);
    });
  }

  if (applianceAdder) {
    applianceAdder.addEventListener("click", (e) => {
      appendApplianceToArray(applianceSelector.value);
      appendApplianceToView(applianceSelector.value);
    });
  }

  if (theForm) {
    theForm.addEventListener("submit", (e) => {
      let ingredientJson = JSON.stringify({needed: selectedIngredients});
      ingredientsInput.value = ingredientJson;  
      appliancesInput.value = selectedAppliances;
      return true;
    });
  }

  if (isEditPath) {
    if (isEditPath.value == "edit") {
      sanitizeSteps();
      loadAppliances();
      loadIngredients();
    }
  }

  // Handle appliances deletion
  on('.active-appliance', 'click', '.appliance-deleter', event => {
    const item = event.target;
    let appliance2Delete = item.id.split("_deleter")[0];
    selectedAppliances = selectedAppliances.filter(appliance => { return appliance !== appliance2Delete });
    item.parentNode.parentNode.removeChild(item.parentNode);
  });

  // Handle ingredients deletion
  on('.active-ingredient', 'click', '.ingredient-deleter', event => {
    const item = event.target;
    let ingredient2Delete = item.id.split("_deleter")[0];
    selectedIngredients = selectedIngredients.filter(ingredient => { return ingredient !== ingredient2Delete });
    item.parentNode.parentNode.removeChild(item.parentNode);
  });

});


const sanitizeSteps = () => {
  let stepsTextArea = document.querySelector("#recipe_steps");
  let objectConstructor = ({}).constructor;

  if (stepsTextArea.value === objectConstructor) {
    stepsTextArea.value = JSON.parse(stepsTextArea.value).join("\n");
  }
  stepsTextArea.style.height = "auto";
}

const on = (selector, eventType, childSelector, eventHandler) => {
  const elements = document.querySelectorAll(selector);
  for (element of elements) {
    element.addEventListener(eventType, eventOnElement => {
      if (eventOnElement.target.matches(childSelector)) {
        eventHandler(eventOnElement);
      }
    });
  }
}