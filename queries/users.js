const db = require("../db/dbConfig");
/**
 * Finds a user by their username.
 * @param {string} username - The username of the user to find.
 * @returns {Promise<object|null>} The user object if found, otherwise null.
 */
const getAllUsers = async () => {
  try {
    const query = "SELECT id, username, email FROM users;"
    const users = await db.any(query);
    return users;
  } catch (error) {
    console.error("Error finding users:", error);
    throw error;
  }
}

const findUserById = async (id) => {
  try {
    const query =
      "SELECT id, username, email FROM users WHERE id = $1;";
    const user = await db.oneOrNone(query, id);
    return user;
  } catch (error) {
    console.error("Error finding user by username:", error);
    throw error;
  }
};

// login stuff below
const findUserByUsername = async (username) => {
  try {
    const query = "SELECT * FROM users WHERE username = $1";

    const user = await db.oneOrNone(query, username);

    return user;
  } catch (error) {
    console.error("Error finding user by username:", error);
    throw error;
  }
};

const createUser = async ({ username, passwordHash, email }) => {
  const query = `
      INSERT INTO users (username, password_hash, email)
      VALUES ($1, $2, $3)
      RETURNING id, username, email; 
    `;
  const newUser = await db.one(query, [username, passwordHash, email]);
  return newUser;
};

module.exports = {
  findUserByUsername,
  findUserById,
  createUser,
  getAllUsers
};
