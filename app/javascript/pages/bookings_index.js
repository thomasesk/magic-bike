const bookingsLayout = () => {
  const bookingTabs = document.querySelector('#booking_tabs');
  if (bookingTabs) {
    const btnMyBookings = document.querySelector('#my_bookings_title');
    const btnMyBikes = document.querySelector('#my_bikes_title');
    const myBookings = document.querySelector('#my_bookings');
    const myBikes = document.querySelector('#my_bikes');

    btnMyBookings.addEventListener("click", (event) => {
      event.preventDefault();
      event.currentTarget.classList.toggle("active");
      btnMyBikes.classList.toggle("active");
      myBookings.hidden = false;
      myBikes.hidden = true;
    });
    btnMyBikes.addEventListener("click", (event) => {
      console.log('toto');
      event.currentTarget.classList.toggle("active");
      btnMyBookings.classList.toggle("active");
      myBookings.hidden = true;
      myBikes.hidden = false;
    });
  };
};


export { bookingsLayout };



