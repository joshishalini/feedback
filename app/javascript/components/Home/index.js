import React, { Component } from 'react'
import axios from "axios";
import { Card } from 'react-bootstrap';
import Slider from '@mui/material/Slider';

export default class Home extends Component {

  constructor() {
    super();
    this.state = {
      questions: [],
    };
  }

  componentDidMount() {
    this.loadQuestions();
  }

  handleChange = (event, newValue) => {
    if (typeof newValue === 'number') {
      let id = event.target.name.split("_")[1]
      this.updateAnswer(id, newValue);
    }
  }

  updateAnswer(id, value){
    let index = this.state.questions.findIndex(i => i.id === id);
    this.state.questions[index].answer = value;
    this.setState({ array: this.state.questions });
  }

  loadQuestions(){
    axios.get("/questions/enabled_questions")
    .then((response) => {
      this.setState({ questions: response.data});
      console.log(this.state.questions)
    })
    .catch(error => {
      console.log(error)
    })
  }

  render() {
    return(
      <div>
        <section className="home-section">       
          <div className="landing-row">
            <div className="head-container">
              <div className="h1 heading text-lg-center">
                <p>Questions</p>                                
              </div>
            </div>
          </div>
        </section>
        <section>
          <div className="row m-5">
           { this.state.questions.map((question, index) => (
              <Card key={index}>
                <Card.Body>
                  <Card.Title>{question.title}</Card.Title>
                  <Card.Subtitle className="mb-2 text-muted w-50 mt-5 m-3">
                    <Slider
                      size="small"
                      valueLabelDisplay="on"
                      aria-label="Small"
                      min={question.min}
                      max={question.max}
                      marks={true}
                      onChange={this.handleChange.bind(this)}
                      name={"slider_"+question.id}
                    />
                  </Card.Subtitle>
                </Card.Body>
                <Card.Footer className="text-muted">{question.answer}</Card.Footer>
              </Card>
                ))}
          </div>
        </section>
      </div>
    )
  }
}