import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ['name']

  connect() {
    console.log('connected')
  }
  
  getArticleName= ()=>{
    const ele = this.nameTarget
    const article_name = ele.textContent
    alert(`you clicked on ,${article_name}`)
  }
}
