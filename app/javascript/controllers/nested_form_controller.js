import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "target"]

  add(event) {
    event.preventDefault()
    // Crea una copia de la plantilla, reemplazando NEW_RECORD con un ID único
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    // Añade la copia al final del contenedor
    this.targetTarget.insertAdjacentHTML("beforeend", content)
  }

  remove(event) {
    event.preventDefault()
    const wrapper = event.target.closest(".nested-fields")
    // Oculta el campo y lo marca para ser eliminado
    if (wrapper) {
      wrapper.style.display = 'none'
      const input = wrapper.querySelector("input[name*='_destroy']")
      if (input) {
        input.value = '1'
      }
    }
  }
}