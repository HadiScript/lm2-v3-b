import React, { useState } from "react";
import { BiSend } from "react-icons/bi";

const Check = () => {
  const [messages, setMessages] = useState([]);
  const [inputValue, setInputValue] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    if (inputValue.trim() !== "") {
      setMessages([...messages, inputValue]);
      setInputValue("");
    }
  };

  return (
    <div style={{ backgroundColor: "#030e22" }}>
      <div className="container ">
        <div className="row py-4">
          <div className="col-md-8 offset-md-2">
            <div
              className="chat-window"
              style={{
                display: "flex",
                flexDirection: "column",
                height: "100vh",
                // border: "1px solid #ddd",
                borderRadius: " 5px",
                overflow: "hidden",
              }}
            >
              <div
                style={{
                  backgroundColor: `rgb(186 186 186)`,
                  padding: "10px",
                  margin: "5px 0",
                  borderRadius: "5px",
                  maxWidth: "100%",
                }}
              >
                <div
                  style={{
                    display: "flex",
                    flexDirection: "row",
                    alignItems: "center",

                    justifyContent: "space-between",
                  }}
                >
                  <div
                    style={{
                      display: "flex",
                      flexDirection: "row",
                      alignItems: "center",
                      gap: "10px",
                    }}
                  >
                    <img
                      src="/images/avatar.jpg"
                      style={{ borderRadius: "50%", height: "60px" }}
                    />
                    <div>
                      <span>Hadi</span>
                      <br />
                      <small style={{ fontSize: "10px" }}>3 min ago</small>
                    </div>
                  </div>
                  <small className="text-danger">delete</small>
                </div>
                <p style={{ marginLeft: "70px" }}>
                  Sure! I can help you design a chatting component for a full
                  page using React and Bootstrap. Here's an example
                  implementation
                </p>
              </div>

              <div
                id="scrollable_div"
                style={{ flex: 1, padding: "10px", overflowY: "scroll" }}
                // ref={listRef}
              >
                {[1, 2, 3, 4, 5, 6].map((x, index) => (
                  <div
                    key={index}
                    style={{
                      backgroundColor: `#f2f2f2`,
                      marginLeft: "50px",
                      padding: "10px",
                      margin: "5px 0",
                      borderRadius: "5px",
                      maxWidth: "100%",
                    }}
                  >
                    <div
                      style={{
                        display: "flex",
                        flexDirection: "row",
                        alignItems: "center",

                        justifyContent: "space-between",
                      }}
                    >
                      <div
                        style={{
                          display: "flex",
                          flexDirection: "row",
                          alignItems: "center",
                          gap: "10px",
                        }}
                      >
                        <img
                          src="/images/avatar.jpg"
                          style={{ borderRadius: "50%", height: "60px" }}
                        />
                        <div>
                          <span>Hadi</span>
                          <br />
                          <small style={{ fontSize: "10px" }}>3 min ago</small>
                        </div>
                      </div>
                      <small className="text-danger">delete</small>
                    </div>
                    <p style={{ marginLeft: "70px" }}>
                      Sure! I can help you design a chatting component for a
                      full page using React and Bootstrap. Here's an example
                      implementation
                    </p>
                  </div>
                ))}
              </div>
              <form onSubmit={(e) => {}}>
                <div
                  style={{
                    padding: "10px",
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "space-between",
                    backgroundColor: "#fff",
                    borderTop: "1px solid #ddd",
                  }}
                >
                  <input
                    className="form-controll"
                    style={{
                      width: "95%",
                      padding: "5px",
                      borderRadius: "10px",
                      borderColor: "gray",
                    }}
                    type="text"
                    placeholder="Type a message..."
                    // value={messageInput}
                    // onChange={(event) => setMessageInput(event.target.value)}
                  />
                  <span type="submit" onClick={() => {}}>
                    <BiSend size={30} color="gray" />
                  </span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Check;
