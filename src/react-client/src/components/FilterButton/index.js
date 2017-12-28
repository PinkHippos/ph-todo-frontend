import React, { Component } from 'react';

class FilterButton extends Component {
  render(){
    return (
      <button
        className='btn btn-secondary'
        onClick={() => this.props.set_filter(this.props.filter_value)}>
        {this.props.filter_name}
      </button>
    );
  };
};

export default FilterButton;
