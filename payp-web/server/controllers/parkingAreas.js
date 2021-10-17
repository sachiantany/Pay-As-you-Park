import express from 'express';
import mongoose from 'mongoose';

import ParkingArea from '../models/ParkingArea.js';

const router = express.Router();

export const getParkingAreas = async (req, res) => {
    try {
        const parkingAreas = await ParkingArea.find();

        res.status(200).json(parkingAreas);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
};

export const getParkingArea = async (req, res) => {
    const { id } = req.params;

    try {
        const parkingArea = await ParkingArea.findById(id);

        res.status(200).json(parkingArea);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
};

export const createParkingArea = async (req, res) => {
    console.log('Parking Area Data Received ' + req.body);
    const post = req.body;

    console.log('UserID: ' + req.userId);
    const newParkingArea = new ParkingArea({user_id: req.userId, ...post,  });

    try {
        await newParkingArea.save();

        res.status(201).json(newParkingArea );
    } catch (error) {
        res.status(409).json({ message: error.message });
    }
};

export const updateParkingArea = async (req, res) => {
    const { id } = req.params;
    const { Name, Address, Capacity, Occupancy, slots } = req.body;

    if (!mongoose.Types.ObjectId.isValid(id)) return res.status(404).send(`No post with id: ${id}`);

    const updatedParkingArea = { Name, Address, Capacity, Occupancy, slots, _id: id };

    await ParkingArea.findByIdAndUpdate(id, updatedParkingArea, { new: true });

    await res.json(updatedParkingArea);
};

export const deleteParkingArea = async (req, res) => {
    const { id } = req.params;

    if (!mongoose.Types.ObjectId.isValid(id)) return res.status(404).send(`No parking area with id: ${id}`);

    await ParkingArea.findByIdAndRemove(id);

    await res.json({ message: "Post deleted successfully." });
};


export default router;