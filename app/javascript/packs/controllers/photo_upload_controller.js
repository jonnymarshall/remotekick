import { Controller } from "stimulus"

export default class extends Controller {

  controllerName = "photo_upload_controller"

  static targets = ["photoUploadInput", "fileName"]

  connect() {
    console.log(`${this.controllerName} connected.`)
  }

  disconnect() {
    console.log(`${this.controllerName} disconnected.`)
  }

  test() {
    console.log("why am I not reaching here???")
  }

  doThis() {
    
    let fullPath = this.photoUploadInputTarget.value;
    var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
    var filename = fullPath.substring(startIndex);
    if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
        filename = filename.substring(1);
    }
    this.fileNameTarget.classList.remove("is-hidden")
    this.fileNameTarget.innerHTML = filename
  }
}