import {Routes, Route} from "react-router-dom";

import Home from "./pages/Home";
import Task from "./pages/Task";
import Handler from "./pages/Handler";
import Auth from "./pages/Auth";


export function App() {

  return (
    <Routes>
      <Route path="/" element={<Home />}/>
      {/* <Route path="/reg" element={<Register />}/>*/}
      <Route path="/log" element={<Auth />}/>
      <Route path="/task" element={<Task />}/>
      <Route path="/handler" element={<Handler />}/>
    </Routes>
  )
}

export default App