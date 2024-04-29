import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log(this.element);
  }

  toggle(e) {
    const id = e.target.dataset.id;
    const csrfToken = document.querySelector("[name='csrf-token']").content;

    console.log(`id is ${id}`);
    fetch(`/articles/${id}/toggle`, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache', 
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ completed: e.target.checked })
    })
    .then(response => response.json())
    .then(data => {
      alert(data.message);
    });
  }
}
