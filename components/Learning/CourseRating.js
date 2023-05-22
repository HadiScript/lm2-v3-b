import React from "react";
import { BsCheck } from "react-icons/bs";

const CourseRating = ({ ...course }) => {
  return (
    <div className="courses-details-desc-style-two">
      <div className="container row justify-content-center">
        <div className="card">
          <ul className="list-group list-group-flush">
           

            <li className="list-group-item d-flex justify-content-between align-items-center pt-3">
              <div className="d-flex justify-content-start gap-2 ">
                <p>Starting Date:</p>
                <span style={{ fontWeight: "bold" }}>
                  {course.startingDate}
                </span>
              </div>

              <div className="d-flex justify-content-start gap-2 ">
                <p>Ending Date:</p>
                <span style={{ fontWeight: "bold" }}>{course.endingDate}</span>
              </div>
            </li>
            <li className="list-group-item d-flex justify-content-between align-items-center">
              <div className="d-flex justify-content-start gap-2 ">
                <p>Timing:</p>
                <span style={{ fontWeight: "bold" }}>
                  {course.startingFrom} to {course._to}
                </span>
              </div>
            </li>
            <li className="list-group-item d-flex justify-content-between align-items-center">
              <div className="d-flex justify-content-start gap-2 ">
                <p>Monday</p>
              </div>

              <div className="d-flex justify-content-start gap-2 ">
                <span style={{ fontWeight: "bold" }}>
                  {course.monday ? <BsCheck size={25} color="green" /> : "X"}
                </span>
              </div>
            </li>

            <li className="list-group-item d-flex justify-content-between align-items-center">
              <div className="d-flex justify-content-start gap-2 ">
                <p>Tuesday</p>
              </div>

              <div className="d-flex justify-content-start gap-2 ">
                <span style={{ fontWeight: "bold" }}>
                  {course.tuesday ? <BsCheck size={25} color="green" /> : "X"}
                </span>
              </div>
            </li>

            <li className="list-group-item d-flex justify-content-between align-items-center">
              <div className="d-flex justify-content-start gap-2 ">
                <p>Wednesday</p>
              </div>

              <div className="d-flex justify-content-start gap-2 ">
                <span style={{ fontWeight: "bold" }}>
                  {course.wednesday ? <BsCheck size={25} color="green" /> : "X"}
                </span>
              </div>
            </li>

            <li className="list-group-item d-flex justify-content-between align-items-center">
              <div className="d-flex justify-content-start gap-2 ">
                <p>Thursday</p>
              </div>

              <div className="d-flex justify-content-start gap-2 ">
                <span style={{ fontWeight: "bold" }}>
                  {course.thursday ? <BsCheck size={25} color="green" /> : "X"}
                </span>
              </div>
            </li>

            <li className="list-group-item d-flex justify-content-between align-items-center">
              <div className="d-flex justify-content-start gap-2 ">
                <p>Friday</p>
              </div>

              <div className="d-flex justify-content-start gap-2 ">
                <span style={{ fontWeight: "bold" }}>
                  {course.friday ? <BsCheck size={25} color="green" /> : "X"}
                </span>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  );
};

export default CourseRating;
