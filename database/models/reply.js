import { Model, DataTypes } from "sequelize";
import connection from "../connection";

const initReplys = (sequelize, Types) => {
  class Replys extends Model {
    static associate(models) {}
  }
  Replys.init(
    {
      id: {
        type: Types.UUID,
        defaultValue: Types.UUIDV4,
        primaryKey: true,
      },

      user_id: DataTypes.STRING,
      comment_id: DataTypes.STRING,
      text: DataTypes.STRING,
    },
    {
      sequelize,
      modelName: "Replys",
      tableName: "replys",
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
  return Replys;
};

export default initReplys(connection, DataTypes);
