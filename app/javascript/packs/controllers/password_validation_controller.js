import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "password_validation_controller"

  static targets = ["email", "password", "passwordConfirm", "validationMessage"]
  
  minimumPasswordLength = 5
  enteredPassword = null
  enteredPasswordConfirmation = null

  connect() {
    console.log(`${this.controllerName} connected.`)
    console.log(this.emailTarget)
    console.log(this.passwordTarget)
    console.log(this.passwordConfirmTarget)
    console.log(this.validationMessageTarget)
    
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  passwordEntryValidation(e) {
    this.enteredPassword = e.target.value
    const showFailedPasswordValidationMessage = () => {
      this.validationMessageTargets[0].innerHTML = "Password must be over 5 characters"
      this.validationMessageTargets[0].classList.remove("is-hidden")
    }

    const hideValidationMessage = () => {
      this.validationMessageTarget.classList.add("is-hidden")
    }

    if (this.enteredPassword.length < this.minimumPasswordLength) {
      showFailedPasswordValidationMessage()
    } else {
      hideValidationMessage()
    }
  }

  passwordConfirmationValidation(e) {
    this.enteredPasswordConfirmation = e.target.value
    const showFailedConfirmationValidationMessage = () => {
      this.validationMessageTarget.innerHTML = "Passwords must match"
      this.validationMessageTarget.classList.remove("is-hidden")
    }

    const hideValidationMessage = () => {
      this.validationMessageTargets[1].classList.add("is-hidden")
    }

    if (this.enteredPasswordConfirmation.value != this.enteredPassword) {
      showFailedConfirmationValidationMessage()
    } else {
      hideValidationMessage()
    }
  }
}