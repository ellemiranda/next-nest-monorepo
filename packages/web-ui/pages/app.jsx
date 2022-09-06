import React from "react";
import { useSelector, useDispatch } from "react-redux";
import { actions } from "../slices/counter";

const App = () => {
  const count = useSelector((state) => state.counter.value);
  // const count = 0
  // const dispatch = (x: any) => {}
  const dispatch = useDispatch();

  return (
    <div>
      <div>
        <span>{count}</span>
        <button onClick={() => dispatch(actions.increment())}>Click</button>
      </div>
    </div>
  );
};

export default App;