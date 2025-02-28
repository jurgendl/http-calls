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
	res.setHeader('Content-Type', 'application/json');
	console.log(users);
	res.send(users);
})

// Adding users to our mock database
router.post('/', (req, res) => {
	res.setHeader('Content-Type', 'application/json');
	let user = req.body;
	const id = uuidv4();
	user = { ...user, id };
	users.push(user);
	const r = {"action":"create","user":user};
	console.log(r);
	res.send(r);
})

// get a particular user
router.get('/:id', (req, res) => {
	res.setHeader('Content-Type', 'application/json');
	const { id } = req.params;
	const foundUser = users.find((user) => user.id === id);
	console.log(foundUser);
	res.send(foundUser);
});

// delete the user from the database
router.delete('/:id', (req, res) => {
	res.setHeader('Content-Type', 'application/json');
	const { id } = req.params;
	const foundUser = users.find((user) => user.id === id);
	if(!foundUser) {
		res.statusCode = 404
		const r = {"action":"delete","id":id,"error":"404"};
		console.log(r);
		res.send(r);
		return;
	}
	users.splice(users.indexOf(foundUser), 1);
	const r = {"action":"delete","id":id,"user":foundUser};
	console.log(r);
	res.send(r);
});

// Make a PATCH request to the database
router.patch('/:id', (req, res) => {
	res.setHeader('Content-Type', 'application/json');
	const { id } = req.params;
	const foundUser = users.find((user) => user.id === id);
	if(!foundUser) {
		res.statusCode = 404
		const r = {"action":"patch","id":id,"error":"404"};
		console.log(r);
		res.send(r);
		return;
	}
	const { first_name, last_name, email } = req.body;
	if (first_name) foundUser.first_name = first_name;
	if (last_name) foundUser.last_name = last_name;
	if (email) foundUser.email = email;
	const r = {"action":"patch","user":foundUser};
	console.log(r);
	res.send(r);
});

export default router