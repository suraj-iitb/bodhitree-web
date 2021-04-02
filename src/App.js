import React from 'react';

class connectionExample extends React.Component {
  componentDidMount() {
    const apiUrl = "http://127.0.0.1:8764/accounts/api";
    fetch(apiUrl)
      .then((response) => response.json())
      .then((data) => console.log(data));
  }

  render() {
    return <div>Example Connection</div>;
  }
}

export default connectionExample;