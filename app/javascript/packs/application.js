import "bootstrap";
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css';

import { loadDynamicBannerText } from '../plugins/typed';
import { initMapbox, fitMapToMarkers } from '../plugins/init_mapbox';
import { initAutocomplete, cityAutocomplete } from '../plugins/init_autocomplete';

loadDynamicBannerText();
initMapbox();
initAutocomplete();
cityAutocomplete();
