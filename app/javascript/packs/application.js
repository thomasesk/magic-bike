import "bootstrap";
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css';

import { loadDynamicBannerText } from '../plugins/typed';
import { initMapbox, fitMapToMarkers } from '../plugins/init_mapbox';

loadDynamicBannerText();
initMapbox();

