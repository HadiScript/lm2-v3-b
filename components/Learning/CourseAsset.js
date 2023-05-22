import baseUrl from "@/utils/baseUrl";
import axios from "axios";
import React, { useEffect, useState } from "react";

const CourseAsset = ({ id: courseId }) => {
  const [assets, setAssets] = useState([]);

  useEffect(() => {
    const fetchAssets = async () => {
      const url = `${baseUrl}/api/assets/${courseId}`;
      const response = await axios.get(url);
      setAssets(response.data.assets);
    };

    fetchAssets();
  }, [courseId]);

  return (
    <div className="courses-details-desc-style-two">
      {/* <div className="row justify-content-center"> */}

      <ul className="list-group">
        {assets.length > 0
          ? assets.map((asset) => (
              <li className="list-group-item d-flex justify-content-between align-items-center">
                <div className="d-flex align-items-center gap-2">
                  <i
                    className="bx bx-file"
                    style={{ textAlign: "center", fontSize: "20px" }}
                  ></i>{" "}
                  <p className="card-title">{asset.lecture_name}</p>
                </div>
                <div className="d-flex align-items-center gap-2">
                  <i
                    className="bx bx-down-arrow-circle"
                    onClick={() => window.open(asset.lecture_file)}
                    style={{
                      textAlign: "center",
                      fontSize: "20px",
                      cursor: "pointer",
                    }}
                  ></i>
                </div>
              </li>
            ))
          : "Empty"}
      </ul>

      {/* <ul className="list-group list-group-flush " style={{ width: "60%" }}>
        {assets.length > 0
          ? assets.map((asset) => (
              <li
                className="list-group-item"
                style={{
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "space-between",
                  gap: "10px",
                  cursor: "pointer",
                }}
                key={asset.id}
              >
                <div className="d-flex align-items-center">
                  <i
                    className="bx bx-file"
                    style={{
                      fontSize: "50px",
                    }}
                  ></i>
                  <h5 className="">{asset.lecture_name}</h5>
                </div>
                <button
                  className="btn btn-success mt-2"
                  onClick={() => window.open(asset.lecture_file)}
                >
                  Download <i className="bx bx-down-arrow-circle"></i>
                </button>
              </li>
            ))
          : "Empty"}
      </ul> */}
    </div>
  );
};

export default CourseAsset;
