class FlexInputBuilder extends React.Component {
    state = { value: '' }
  
    componentDidMount = () => {
      this.setState({value: this.props.passedValue})
    }
  
    onChangeHandler = (e) => this.setState({value: e.target.value})
  
    render() {
      const {value} = this.state;
      return (
        <div>
          <label>
            Pick the date
            <input value={value}
                   type='date'
                   className="form-control bg-light"
                   placeholder="pick your date"
                   onChange={this.onChangeHandler}
                   id={this.state.id}
            />
          </label>
        </div>
      )
    }
  }
  
  const elementID = document.getElementById('flexInput-builder');
  
  ReactDOM.render(
    <FlexInputBuilder passedValue={elementID.dataset.initialvalue}/>,
    document.getElementById('flexInput-builder')
  );