import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Paris ^1000", "Londres ^1000", "New York ^1000", "Tokyo ^1000", "Melbourne ^1000"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
