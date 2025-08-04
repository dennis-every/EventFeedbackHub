import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="star-rating"
export default class extends Controller {
  static targets = ["input", "star"]

  connect() {
    this.syncStars()
  }

  select(event) {
    const value = event.currentTarget.dataset.value
    this.inputTargets.forEach(input => {
      input.checked = input.value === value
    })
    this.syncStars()
  }

  syncStars() {
    const checkedInput = this.inputTargets.find(input => input.checked)
    const value = checkedInput ? parseInt(checkedInput.value) : 0

    this.starTargets.forEach(star => {
      const starValue = parseInt(star.dataset.value)
      if (starValue <= value) {
        star.classList.add("text-warning")
      } else {
        star.classList.remove("text-warning")
      }
    })
  }
}
