import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "password_validation_controller"

  static targets = ["email", "password", "passwordConfirm", "validationMessage"]
  
  minimumPasswordLength = 6
  enteredEmail = null
  enteredPassword = null
  enteredPasswordConfirmation = null

  connect() {
    console.log(`${this.controllerName} connected.`)
    console.log(this.validationMessageTargets)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  passwordEntryValidation(e) {
    this.enteredPassword = e.target.value
    const showFailedPasswordValidationMessage = () => {
      this.validationMessageTargets[0].innerHTML = `Password must be at least ${this.minimumPasswordLength} characters`
      this.validationMessageTargets[0].classList.remove("is-hidden")
    }

    const hideFailedPasswordValidationMessage = () => {
      this.validationMessageTargets[0].classList.add("is-hidden")
    }

    if (this.enteredPassword.length < this.minimumPasswordLength) {
      showFailedPasswordValidationMessage()
    } else {
      hideFailedPasswordValidationMessage()
    }
  }

  passwordConfirmationValidation(e) {
    this.enteredPasswordConfirmation = e.target.value
    const showFailedConfirmationValidationMessage = () => {
      this.validationMessageTargets[1].innerHTML = "Passwords must match"
      this.validationMessageTargets[1].classList.remove("is-hidden")
    }

    const hideFailedConfirmationValidationMessage = () => {
      this.validationMessageTargets[1].classList.add("is-hidden")
    }

    if (this.enteredPasswordConfirmation.value != this.enteredPassword) {
      showFailedConfirmationValidationMessage()
    } else {
      hideFailedConfirmationValidationMessage()
    }
  }

  emailEntryValidation(e) {
    this.enteredEmail = e.target.value
    const showFailedEmailValidationMessage = () => {
      this.validationMessageTargets[2].innerHTML = "Email must be valid"
      this.validationMessageTargets[2].classList.remove("is-hidden")
    }

    const hideEmailValidationMessage = () => {
      this.validationMessageTargets[2].classList.add("is-hidden")
    }

    if (!this.enteredEmail.includes("@")) {
      showFailedEmailValidationMessage()
    } else {
      hideEmailValidationMessage()
    }
  }
}