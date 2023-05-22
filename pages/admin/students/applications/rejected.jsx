import Backdrop from "@/components/Backdrop";
import AdminSideNav from "@/components/_App/AdminSideNav";
import Footer from "@/components/_App/Footer";
import Navbar from "@/components/_App/Navbar";
import GeneralLoader from "@/utils/GeneralLoader";
import baseUrl from "@/utils/baseUrl";
import axios from "axios";
import { AnimatePresence, motion } from "framer-motion";
import React, { useEffect, useState } from "react";
import { AiOutlineMail } from "react-icons/ai";
import { BiPhoneCall } from "react-icons/bi";
import { CiLocationArrow1 } from "react-icons/ci";
import { HiOutlineIdentification } from "react-icons/hi";
import { MdLocationCity } from "react-icons/md";
import { RxAvatar } from "react-icons/rx";
import { BsCalendar2Date } from "react-icons/bs";
import { RiParentFill } from "react-icons/ri";
import { TbTie } from "react-icons/tb";
import { toast } from "react-hot-toast";
import { parseCookies } from "nookies";
import Link from "next/link";

const Rejected = ({ user }) => {
  const { elarniv_users_token } = parseCookies();

  // stuApps -> student applications
  const [rejectedApps, setrejectedApps] = useState([]);
  const [loading, setLoading] = useState(false);
  const [modalOpen, setModalOpen] = useState();
  const [currentStuApp, setCurrentStuApp] = useState({});

  const close = () => {
    setModalOpen(false);
    document.body.style.overflow = "unset";
  };

  const fetchData = async () => {
    setLoading(true);
    try {
      const response = await axios.get(
        `${baseUrl}/api/student_app/GetRejectedApp`
      );
      setrejectedApps(response.data.students_apps);
      setLoading(false);
    } catch (err) {
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

  useEffect(() => {
    fetchData();
  }, []);

  return (
    <>
      <Navbar user={user} />
      {/* {JSON.stringify(stuApps)} */}
      {/* table student applicatons */}
      <div className="main-content">
        <div className="container-fluid">
          <div className="row">
            {/* sidebar */}
            <div className="col-lg-3 col-md-4">
              <AdminSideNav user={user} />
            </div>

            <div className="col-lg-9 col-md-8">
              <div className="main-content-box">
                <ul className="nav-style1">
                  <li>
                    <Link href="/admin/students/applications/pending">
                      <a>Pending</a>
                    </Link>
                  </li>
                  <li>
                    <Link href="/admin/students/applications/confirm">
                      <a>Approved</a>
                    </Link>
                  </li>
                  <li>
                    <Link href="/admin/students/applications/rejected">
                      <a className="active">Rejected</a>
                    </Link>
                  </li>
                </ul>
                {loading ? (
                  <GeneralLoader />
                ) : (
                  <div className="table-responsive">
                    <table className="table align-middle table-hover fs-14">
                      <thead>
                        <tr>
                          <th scope="col">Name</th>
                          <th scope="col">Email</th>
                          <th scope="col">ID Card</th>
                          <th scope="col">Phone Number</th>
                          <th scope="col">Education</th>
                          <th scope="col"></th>
                          <th scope="col"></th>
                        </tr>
                      </thead>
                      <tbody>
                        {rejectedApps && rejectedApps.length > 0 ? (
                          rejectedApps.map((user) => (
                            <tr key={user.id}>
                              <td>{`${user.firstName} ${user.lastName}`}</td>
                              <td>{user.email}</td>
                              <td>{user.idCard}</td>
                              <td>{user.phoneNumber}</td>
                              <td>{user.education}</td>

                              <td>
                                <span
                                  style={{ cursor: "pointer" }}
                                  onClick={() => {
                                    setModalOpen(true);
                                    setCurrentStuApp(user);
                                  }}
                                  className="text-primary"
                                >
                                  View
                                </span>
                              </td>
                            </tr>
                          ))
                        ) : (
                          <tr>
                            <td colSpan="7" className="text-center py-3">
                              Empty!
                            </td>
                          </tr>
                        )}
                      </tbody>
                    </table>
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>

      <Footer />

      {/* model view*/}
      <AnimatePresence initial={false} onExitComplete={() => null} mode="wait">
        {modalOpen && (
          <Backdrop onClick={() => {}}>
            <motion.div
              className="modal fade show"
              onClick={(e) => e.stopPropagation()}
              //   variants={dropIn}
              initial="hidden"
              animate="visible"
              exit="exit"
            >
              <div className="modal-dialog modal-dialog-centered">
                <div className="modal-content">
                  <button type="button" className="btn-close" onClick={close}>
                    <i className="bx bx-x"></i>
                  </button>

                  <div className="container">
                    <div className="py-5">
                      <div
                        style={{
                          display: "flex",
                          flexDirection: "row",
                          alignItems: "center",
                          justifyContent: "start",
                          gap: "10px",
                        }}
                      >
                        <img
                          src="/images/avatar.jpg"
                          alt={currentStuApp.lastName}
                          style={{
                            height: "50px",
                            width: "50px",
                            borderRadius: "50%",
                            marginBottom: "10px",
                          }}
                        />
                        <h2>
                          {currentStuApp.firstName + currentStuApp.lastName}
                        </h2>
                      </div>
                      <hr />

                      <div className="row">
                        <div className="col-lg-1 col-md-0" />
                        <div className="col-lg-9 col-md-12">
                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            {/* <AiOutlineMail />  */}
                            <span className="text-secondary">Email</span>
                            <span className="text-dark">
                              {currentStuApp.email}
                            </span>
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">ph#</span>
                            <span className="text-dark">
                              {currentStuApp.phoneNumber}
                            </span>

                            {/* <BiPhoneCall />
                            <span className="text-primary">
                              {currentStuApp.phoneNumber}
                            </span> */}
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">CNIC#</span>
                            <span className="text-dark">
                              {currentStuApp.idCard}
                            </span>
                            {/* <HiOutlineIdentification />
                            <span className="">{currentStuApp.idCard}</span> */}
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">Address</span>
                            <span className="text-dark">
                              {currentStuApp.address}
                            </span>
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">City</span>
                            <span className="text-dark">
                              {currentStuApp.city}
                            </span>
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">
                              Date of birth
                            </span>
                            <span className="text-dark">
                              {currentStuApp.dateOfBirth}
                            </span>
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">Education</span>
                            <span className="text-dark">
                              {currentStuApp.education}
                            </span>
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">Gender</span>
                            <span className="text-dark">
                              {currentStuApp.gender}
                            </span>
                          </div>

                          <br />

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">Father Name</span>
                            <span className="text-dark">
                              {currentStuApp.parentName}
                            </span>
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">Occupation</span>
                            <span className="text-dark">
                              {currentStuApp.parentOccupations}
                            </span>
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">
                              Father phone #
                            </span>
                            <span className="text-dark">
                              {currentStuApp.parentPhoneNumber}
                            </span>
                          </div>
                          <br />
                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">Interest</span>
                            <span className="text-dark">
                              {currentStuApp.interest}
                            </span>
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">
                              Want to acheive
                            </span>
                            <span className="text-dark">
                              {currentStuApp.wantToAchieve}
                            </span>
                          </div>

                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">
                              Enroll to {currentStuApp.enrollTo}
                            </span>
                            <span className="text-dark">
                              {currentStuApp.enrollTo === "program"
                                ? currentStuApp.course
                                : ""}
                              {currentStuApp.enrollTo === "workshop"
                                ? currentStuApp.workshop
                                : ""}
                            </span>
                          </div>
                          <br />
                          <br />
                          <div
                            style={{
                              display: "flex",
                              flexDirection: "row",
                              alignItems: "center",
                              justifyContent: "start",
                              gap: "10px",
                              marginTop: "10px",
                              fontWeight: "bold",
                            }}
                          >
                            <span className="text-secondary">
                              reason
                            </span>
                            <span className="text-dark">
                              {currentStuApp.remarks}
                            </span>
                          </div>
                        </div>
                        <div className="col-lg-2 col-md-0" />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </motion.div>
          </Backdrop>
        )}
      </AnimatePresence>
    </>
  );
};

export default Rejected;
