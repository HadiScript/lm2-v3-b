import React from "react";

const InstructorRow = ({
  id,
  first_name,
  last_name,
  email,
  phone,
  instructor_subject,
  instructor_description,
  instructor_status,
}) => {
  return (
    <tr>
      <td>{`${first_name} ${last_name}`}</td>
      <td>{email}</td>
      <td>{phone}</td>
      <td>{instructor_subject}</td>
      <td>
        <div className="max-300px max-height-60">{instructor_description}</div>
      </td>
      <td>
        <span type="button" className="btn btn-success btn-sm fs-12">
          {JSON.stringify(instructor_status)}
        </span>
      </td>
      {/* {!instructor_request_confirmed && (
        <td>
          <button
            type="button"
            className="btn btn-success btn-sm fs-12 ms-2"
            onClick={() => onApprove(id)}
          >
            Approve Now
          </button>

          <button
            type="button"
            className="btn btn-danger btn-sm fs-12 ms-2"
            onClick={() => onDeny(id)}
          >
            Decline
          </button>
        </td>
      )} */}
    </tr>
  );
};

export default InstructorRow;
