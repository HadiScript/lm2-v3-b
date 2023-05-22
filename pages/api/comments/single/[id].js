// import Reply from "@/database/models/reply";
import { Comments, User } from "database/models";

export default async function handler(req, res) {
  if (!("authorization" in req.headers)) {
    return res.status(401).json({ message: "No autorization token" });
  }
  switch (req.method) {
    case "GET":
      await handleGet(req, res);
      break;

    default:
      res.status(405).json({
        message: `Method ${req.method} not allowed`,
      });
  }
}

const handleGet = async (req, res) => {
  const { id } = req.query; //coment id
  try {
    const comment = await Comments.findOne({
      include: [
        {
          model: User,
          as: "User",
          attributes: ["first_name", "last_name", "role"],
        },
      ],
      where: {
        id: id,
      },
    });

    res.status(200).json({ comment });
  } catch (e) {
    res.status(400).json({
      error_code: "get_courses",
      message: e.message,
    });
  }
};
