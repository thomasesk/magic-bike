import "bootstrap";
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css';

import { loadDynamicBannerText } from '../plugins/typed';
import { initMapbox, fitMapToMarkers } from '../plugins/init_mapbox';
import { initAutocomplete, cityAutocomplete } from '../plugins/init_autocomplete';
import { bookingsLayout } from '../pages/bookings_index';

loadDynamicBannerText();
initMapbox();
bookingsLayout();
initAutocomplete();
cityAutocomplete();

