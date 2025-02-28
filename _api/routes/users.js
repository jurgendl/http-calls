import express from 'express';
import { v4 as uuidv4 } from 'uuid';

const router = express.Router();

let users = [
	// {
	//   first_name: 'John',
	//   last_name: 'Doe',
	//   email: 'johndoe@example.com',
	// },
	// {
	//   first_name: 'Alice',
	//   last_name: 'Smith',
	//   email: 'alicesmith@example.com',
	// },
];

// Getting the list of users from the mock database
router.get('/', (req, res) => {
	// console.log(users);
	res.send(users);
})

// Adding users to our mock database
router.post('/', (req, res) => {
	let user = req.body;
	const id = uuidv4();
	user = { ...user, id };
	users.push(user);
	res.setHeader('Content-Type', 'application/json');
	res.send(`{"action":"created","user":${JSON.stringify(user)}}`);
})

// get a particular user
router.get('/:id', (req, res) => {
	const { id } = req.params;
	const foundUser = users.find((user) => user.id === id);
	res.setHeader('Content-Type', 'application/json');
	res.send(foundUser)
});

// delete the user from the database
router.delete('/:id', (req, res) => {
	const { id } = req.params;
	const foundUser = users.find((user) => user.id !== id);
	res.setHeader('Content-Type', 'application/json');
	res.send(`{"action":"deleted","user":${JSON.stringify(foundUser)}}`);
});

// Make a PATCH request to the database
router.patch('/:id', (req, res) => {
	const { id } = req.params;
	const { first_name, last_name, email } = req.body;
	const foundUser = users.find((user) => user.id === id);
	if(!foundUser) 
	if (first_name) foundUser.first_name = first_name;
	if (last_name) foundUser.last_name = last_name;
	if (email) foundUser.email = email;
	res.setHeader('Content-Type', 'application/json');
	res.send(foundUser);
});

export default router