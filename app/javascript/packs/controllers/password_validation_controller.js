import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "password_validation_controller"

  static targets = ["email", "password", "passwordConfirm", "validationMessageContainer"]
  
  minimumPasswordLength = 6
  enteredEmail = null
  enteredPassword = null
  enteredPasswordConfirmation = null
  validationMessages = []

  connect() {
    console.log(`${this.controllerName} connected.`)
    this.setInitialValues()
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  setInitialValues() {
    this.enteredEmail = this.emailTarget.value
    this.enteredPassword = this.passwordTarget.value
    if (this.hasPasswordConfirmTarget) {
      this.enteredPasswordConfirmation = this.passwordConfirmTarget.value
    }
  }

  // Key up event triggers
  async emailEntryValidation(e) {
    this.enteredEmail = e.target.value
    this.validationMessages = []
    await this.checkValidations()
    this.refreshValidationMessages()
  }

  async passwordEntryValidation(e) {
    this.enteredPassword = e.target.value
    this.validationMessages = []
    await this.checkValidations()
    this.refreshValidationMessages()
  }

  async passwordConfirmationValidation(e) {
    this.enteredPasswordConfirmation = e.target.value
    this.validationMessages = []
    await this.checkValidations()
    this.refreshValidationMessages()
  }

  

  // Validations
  checkValidations() {
    // email
    if (!!this.enteredEmail) {
      if (!this.enteredEmail.includes("@")) {
        this.validationMessages.push(this.validationMessage(
          {
            subject: "Email",
            qualifier: "must be",
            value: "valid"
          })
        )
      }
    } else {
      this.validationMessages.push(this.validationMessage(
        {
          subject: "Email",
          qualifier: "cannot be",
          value: "blank"
        })
      )
    }

    if (!!this.enteredPassword) {
      // passwordEntry
      if (this.enteredPassword.length < this.minimumPasswordLength) {
        this.validationMessages.push(this.validationMessage(
          {
            subject: "Password",
            qualifier: "must be at least",
            value: `${this.minimumPasswordLength} characters`
          })
        )
      }

      // passwordConfirmation
      if (!!this.enteredPasswordConfirmation) {
        if (this.enteredPassword != this.enteredPasswordConfirmation) {
          this.validationMessages.push(this.validationMessage(
            {
              subject: "Passwords",
              qualifier: "must",
              value: "match"
            })
          )
        }
      }
    } else {
      if (this.enteredPassword != this.enteredPasswordConfirmation) {
        this.validationMessages.push(this.validationMessage(
          {
            subject: "Password",
            qualifier: "cannot",
            value: "be blank"
          })
        )
      }
    }
  }

  // HTML generators
  validationMessage(message) {
    return `<p class="help is-danger">
      ${message.subject} ${message.qualifier} ${message.value}.
    </p>`
  }

  refreshValidationMessages() {
    this.validationMessageContainerTarget.innerHTML = ""
    this.validationMessages.sort().forEach((message) => this.validationMessageContainerTarget.insertAdjacentHTML("afterbegin", message))
  }
}