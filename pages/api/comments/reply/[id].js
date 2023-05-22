// import Reply from "@/database/models/reply";
import { Replys, User } from "database/models";
import jwt from "jsonwebtoken";

export default async function handler(req, res) {
  if (!("authorization" in req.headers)) {
    return res.status(401).json({ message: "No autorization token" });
  }
  switch (req.method) {
    case "GET":
      await handleGet(req, res);
      break;
    case "POST":
      await handlePost(req, res);
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
    const allReplys = await Replys.findAll({
      order: [["created_at", "ASC"]],
      include: [
        {
          model: User,
          as: "User",
          attributes: ["first_name", "last_name", "role"],
        },
      ],
      where: {
        comment_id: id,
      },
    });

    res.status(200).json({ msgs: allReplys });
  } catch (e) {
    res.status(400).json({
      error_code: "get_courses",
      message: e.message,
    });
  }
};

const handlePost = async (req, res) => {
  const { id } = req.query; //comment_id
  const { text } = req.body;
  //   res.json({ text, id });
  //   console.log(id, text, "from reply posts");
  //   return;
  try {
    const { userId } = jwt.verify(
      req.headers.authorization,
      process.env.JWT_SECRET
    );

    const newReply = await Replys.create({
      user_id: userId,
      comment_id: id,
      text,
    });

    return res.status(200).json({
      message: "added",
      msg: newReply,
    });
  } catch (e) {
    res.status(400).json({
      error_code: "post_reply",
      message: e.message,
    });
  }
};
