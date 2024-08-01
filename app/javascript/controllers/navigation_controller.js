import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  loadContent(event) {
    event.preventDefault();
    const section = event.currentTarget.dataset.section;

    fetch(`/admin/${section}`)
      .then(response => response.text())
      .then(html => {
        document.getElementById('content').innerHTML = html;
      });
  }
}
