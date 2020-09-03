import Typed from 'typed.js';

const newText = () => {
const text = document.getElementById("typed");
  if (text) {
    new Typed("#typed", {
      strings: ['Web Developer', 'Designer', 'Software Engineer'],
      typeSpeed: 70,
      loop: true
    });
  }
}
export { newText };
