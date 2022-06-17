import React, { useState, useEffect } from 'react';
import { createRoot } from 'react-dom/client';
import axios from 'axios';

const Layout = props => {
    const [test, setTest] = useState("");
    useEffect(() => {
        (async () => {
            setTest((await axios("http://localhost:8081/test")).data);
        })();
    });
    return <h1>{test}</h1>
};

const app = document.getElementById('app');
const root = createRoot(app);
root.render(<Layout />);
