import PropTypes from 'prop-types';

export const tagPropTypes = PropTypes.shape({
  id: PropTypes.number.isRequired,
  bg_color_hex: PropTypes.string.isRequired,
  hotness_score: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  text_color_hex: PropTypes.string.isRequired,
  points: PropTypes.number.isRequired,
}).isRequired;
