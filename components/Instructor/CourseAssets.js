import React from "react";

const CourseAssets = ({
  id: assetId,
  lecture_name,
  lecture_file,
  onDelete,
}) => {
  return (
    <>
      <ul className="list-group">
        <li className="list-group-item d-flex justify-content-between align-items-center">
          <div className="d-flex align-items-center gap-2">
            <i
              className="bx bx-file"
              style={{ textAlign: "center", fontSize: "20px" }}
            ></i>{" "}
            <p className="card-title">{lecture_name}</p>
          </div>
          <div className="d-flex align-items-center gap-2">
            <i
              className="bx bx-down-arrow-circle"
              onClick={() => window.open(lecture_file)}
              style={{
                textAlign: "center",
                fontSize: "20px",
                cursor: "pointer",
              }}
            ></i>
            <i
              onClick={() => onDelete(assetId)}
              className="bx bx-trash text-danger"
            ></i>
          </div>
        </li>
      </ul>
    </>
    // <div className="col-lg-4 col-md-6">
    //   <div className="card mt-4" style={{ width: "18rem" }}>
    // <i
    //   className="bx bx-file"
    //   style={{ textAlign: "center", fontSize: "100px" }}
    // ></i>
    //     {/* {lecture_file} */}
    //     <div className="card-body">
    //       <h5 className="card-title">{lecture_name}</h5>
    //   <button
    //     className="btn btn-success me-3"
    //     onClick={() => window.open(lecture_file)}
    //   >
    //     Download <i className="bx bx-down-arrow-circle"></i>
    //   </button>
    //       <button onClick={() => onDelete(assetId)} className="btn btn-danger">
    //         Delete <i className="bx bx-trash"></i>
    //       </button>
    //     </div>
    //   </div>
    // </div>
  );
};

export default CourseAssets;
