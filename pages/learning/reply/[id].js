import baseUrl from "@/utils/baseUrl";
import axios from "axios";
import { useRouter } from "next/router";
import { parseCookies } from "nookies";
import React, { useEffect, useState } from "react";
import { toast } from "react-hot-toast";
import { BiSend } from "react-icons/bi";
import { BsArrowLeft } from "react-icons/bs";
import ReactTimeAgo from "react-time-ago";

const ReplyOfComment = ({ user }) => {
  const { elarniv_users_token } = parseCookies();

  const router = useRouter();
  const { id } = router.query;

  const [mainComment, setMainComment] = useState({});
  const [messageInput, setMessageInput] = useState("");
  const [allReplys, setAllReplys] = useState([]);
  const [loading, setLoading] = useState(false);

  const fetchMainComment = async () => {
    const payload = {
      headers: { Authorization: elarniv_users_token },
    };
    const url = `${baseUrl}/api/comments/single/${id}`;
    const { data } = await axios.get(url, payload);
    setMainComment(data.comment);
  };

  const fetchAllComments = async () => {
    const payload = {
      headers: { Authorization: elarniv_users_token },
    };
    const url = `${baseUrl}/api/comments/reply/${id}`;
    const { data } = await axios.get(url, payload);
    setAllReplys(data.msgs);
  };

  useEffect(() => {
    if (id) {
      fetchMainComment();
      fetchAllComments();
    }
  }, [id]);

  const postReply = async (e) => {
    e.preventDefault();
    if (!messageInput) {
      toast.error("please type something...");
      return;
    }
    try {
      setLoading(true);
      const payloadHeader = {
        headers: { Authorization: elarniv_users_token },
      };

      const url = `${baseUrl}/api/comments/reply/${id}`;
      const response = await axios.post(
        url,
        { text: messageInput },
        payloadHeader
      );
      setLoading(false);
      setMessageInput("");
      setAllReplys([...allReplys, response.data.msgs]);
      fetchAllComments();
    } catch (err) {
      console.log(err);
      let {
        response: {
          data: { message },
        },
      } = err;
      toast.error(message, {
        style: {
          border: "1px solid #ff0033",
          padding: "16px",
          color: "#ff0033",
        },
        iconTheme: {
          primary: "#ff0033",
          secondary: "#FFFAEE",
        },
      });
    } finally {
      setLoading(false);
    }
  };

  const deleteComment = async (replyId) => {
    try {
      setLoading(true);
      const payloadHeader = {
        headers: { Authorization: elarniv_users_token },
      };

      const url = `${baseUrl}/api/comments/reply/delete/${replyId}`;
      const response = await axios.delete(url, payloadHeader);
      setLoading(false);
      toast.success("msg deleted");
      fetchAllComments();
    } catch (err) {
      console.log(err);
      let {
        response: {
          data: { message },
        },
      } = err;
      toast.error(message, {
        style: {
          border: "1px solid #ff0033",
          padding: "16px",
          color: "#ff0033",
        },
        iconTheme: {
          primary: "#ff0033",
          secondary: "#FFFAEE",
        },
      });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ backgroundColor: "#030e22" }}>
      {/* {JSON.stringify(allReplys)} */}
      <div className="container ">
        <div className="row ">
          <div className="col-md-2 col-sm-0 col-xs-0 text-light">
            <div
              onClick={() => router.back()}
              style={{ cursor: "pointer", marginTop: "50px" }}
            >
              <BsArrowLeft className="mx-2" />
              Back
            </div>
          </div>
          <div className="col-md-8 ">
            <div
              className="chat-window"
              style={{
                display: "flex",
                flexDirection: "column",
                height: "100vh",
                padding: "5px",
                // border: "1px solid #ddd",
                borderRadius: " 5px",
                overflow: "hidden",
              }}
            >
              {/* main comment */}
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
                      <span>
                        {mainComment && mainComment.User && (
                          <>
                            {mainComment.User.role === "instructor" ||
                            mainComment.User.role === "cord" ? (
                              "Admin"
                            ) : (
                              <>
                                {mainComment.User.first_name}
                                {mainComment.User.last_name}
                              </>
                            )}
                          </>
                        )}
                      </span>
                      <br />
                      <small style={{ fontSize: "10px" }}>
                        {mainComment && mainComment.created_at && (
                          <ReactTimeAgo
                            date={mainComment.created_at}
                            locale="en-US"
                          />
                        )}
                      </small>
                    </div>
                  </div>
                </div>
                <p style={{ marginLeft: "70px" }}>
                  {" "}
                  {mainComment && mainComment.text}{" "}
                </p>
              </div>

              <div
                id="scrollable_div"
                style={{ flex: 1, padding: "10px", overflowY: "scroll" }}
                // ref={listRef}
              >
                {allReplys.length > 0 ? (
                  allReplys.map((x, index) => (
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
                            <span>
                              {x && x.User && (
                                <>
                                  {x.User.role === "instructor" ||
                                  x.User.role === "cord" ? (
                                    "Admin"
                                  ) : (
                                    <>
                                      {x.User.first_name} {x.User.last_name}
                                    </>
                                  )}
                                </>
                              )}
                            </span>
                            <br />
                            <small style={{ fontSize: "10px" }}>
                              {x && x.created_at && (
                                <ReactTimeAgo
                                  date={x.created_at}
                                  locale="en-US"
                                />
                              )}
                            </small>
                          </div>
                        </div>
                        {x && x.User && (
                          <>
                            {x.user_id === user.id && (
                              <small
                                className="text-danger"
                                onClick={() => deleteComment(x.id)}
                              >
                                delete
                              </small>
                            )}{" "}
                          </>
                        )}
                      </div>
                      <p style={{ marginLeft: "70px" }}> {x && x.text} </p>
                    </div>
                  ))
                ) : (
                  <h3 className="text-light text-center ">No any reply</h3>
                )}
              </div>
              <form onSubmit={(e) => postReply(e)}>
                <div
                  style={{
                    padding: "10px",
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "space-between",
                    // backgroundColor: "#fff",
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
                      backgroundColor: "transparent",
                      color: "white",
                    }}
                    type="text"
                    placeholder="Type comment..."
                    value={messageInput}
                    onChange={(event) => setMessageInput(event.target.value)}
                  />
                  <span type="submit" onClick={(e) => postReply(e)}>
                    <BiSend size={30} color="gray" />
                  </span>
                </div>
              </form>
            </div>
          </div>
          <div className="col-md-2 col-sm-0 col-xs-0" />
        </div>
      </div>
    </div>
  );
};

export default ReplyOfComment;
