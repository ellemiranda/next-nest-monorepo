import { useContext } from 'react';
import { CountContext } from '../../../contexts/count-context'


const Counter = () => {
  const context = useContext(CountContext);

  return (
    <div>
      <span>{context.count}</span>
      <button
        type="button"
        onClick={() => context.setCount(context.count + 1)}
      >
        Click
      </button>
    </div>
  )
}

export default Counter