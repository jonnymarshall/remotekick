import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "password_validation_controller"

  static targets = ["email", "password", "passwordConfirm", "validationMessageContainer"]
  
  minimumPasswordLength = 6
  enteredEmail = null
  enteredPassword = null
  enteredPasswordConfirmation = null
  validationMessages = []
  fieldsToValidate = []

  connect() {
    console.log(`${this.controllerName} connected.`)
    this.setInitialValues()
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  setInitialValues() {
    if (this.hasEmailTarget) {
      this.enteredEmail = this.emailTarget.value
      this.fieldsToValidate.push("email")
    }
    if (this.hasPasswordTarget) {
      this.enteredPassword  = this.passwordTarget.value
      this.fieldsToValidate.push("password")
    }
    if (this.hasPasswordConfirmTarget) {
      this.enteredPasswordConfirmation = this.passwordConfirmTarget.value
      this.fieldsToValidate.push("passwordConfirm")
    }
  }

  // Key up event triggers
  async emailEntryValidation(e) {
    this.enteredEmail = e.target.value
    this.refreshValidationMessages()
  }

  async passwordEntryValidation(e) {
    this.enteredPassword = e.target.value
    this.refreshValidationMessages()
  }

  async passwordConfirmationValidation(e) {
    this.enteredPasswordConfirmation = e.target.value
    this.refreshValidationMessages()
  }

  

  // Validations
  checkValidations() {
    this.fieldsToValidate.forEach((field) => {
      if (field == "email") {
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
      }
      
      if (field == "password") {
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
        }
      }

      if (field == "passwordConfirm") {
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
    })
  }

  // HTML generators
  validationMessage(message) {
    return `<p class="help is-danger">
      ${message.subject} ${message.qualifier} ${message.value}.
    </p>`
  }

  async refreshValidationMessages() {
    this.validationMessages = []
    await this.checkValidations()
    this.validationMessageContainerTarget.innerHTML = ""
    this.validationMessages.sort().forEach((message) => this.validationMessageContainerTarget.insertAdjacentHTML("afterbegin", message))
  }
}