const db = require("../data/db-config");

const find = () => {
	return db("schemes");
};

const findById = id => {
	return db("schemes").where({ id }).first();
};

const findSteps = id => {
	return db("steps")
		.select(
			"steps.id",
			"schemes.scheme_name",
			"steps.step_number",
			"steps.instructions"
		)
		.join("schemes", "steps.scheme_id", "schemes.id")
		.where({ scheme_id: id })
		.orderBy("steps.step_number");
};

const add = schemeData => {
	return db("schemes").insert(schemeData);
};

const addStep = async (step, scheme_id) => {
	await db("steps").insert({ ...step, scheme_id });
};

const update = (changes, id) => {
	return db("schemes").where({ id }).update(changes);
};

const remove = id => {
	return db("schemes").where({ id }).del();
};

module.exports = {
	find,
	findById,
	findSteps,
	add,
	addStep,
	update,
	remove
};
