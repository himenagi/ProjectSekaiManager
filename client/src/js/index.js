import React, { useState, useEffect } from 'react';
import { createRoot } from 'react-dom/client';
import axios from 'axios';

const Layout = props => {
    const [test, setTest] = useState("");
    useEffect(() => {
        (async () => {
            const units = (await axios("http://localhost:8081/test")).data;
            setTest(JSON.stringify(units));
        })();
    }, []);
    return <p>{test}</p>
};

const app = document.getElementById('app');
const root = createRoot(app);
root.render(<Layout />);
