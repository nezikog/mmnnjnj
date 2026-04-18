import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

export default function Setup() {
    const [courses, setCourses] = useState<any[]>([]);
    const [selectedCourse, setSelectedCourse] = useState<number>(1);
    const [activeTime, setActiveTime] = useState<number>(0);
    const [classNumber, setClassNumber] = useState<string>('9');
    const [deadline, setDeadline] = useState<string>('');
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');
    const navigate = useNavigate();
    
    const userId = localStorage.getItem('userId');
    
    useEffect(() => {
        // Загружаем список курсов из БД
        fetch('http://localhost:5000/api/user/get-courses')
            .then(res => res.json())
            .then(data => setCourses(data))
            .catch(err => console.error('Error loading courses:', err));
        
        // Устанавливаем дедлайн по умолчанию (через 30 дней)
        const defaultDeadline = new Date();
        defaultDeadline.setDate(defaultDeadline.getDate() + 30);
        setDeadline(defaultDeadline.toISOString().slice(0, 16));
    }, []);
    
    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setError('');
        
        try {
            const setupData = {
                userId: parseInt(userId!),
                courseId: selectedCourse,
                activityTime: activeTime,
                classNumber: parseInt(classNumber),
                deadline: deadline
            };
            
            console.log('Setup data:', setupData);
            
            const response = await fetch('http://localhost:5000/api/user/setup', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(setupData)
            });
            
            const data = await response.json();
            
            if (response.ok && data.success) {
                navigate('/handler'); // Переходим на главную страницу
            } else {
                setError(data.error || 'Ошибка сохранения настроек');
            }
        } catch (err) {
            setError('Ошибка соединения с сервером');
        } finally {
            setLoading(false);
        }
    };
    
    return (
        <div style={containerStyle}>
            <div style={formContainerStyle}>
                <h2 style={titleStyle}>Настройка профиля</h2>
                <p style={subtitleStyle}>Выберите предмет, класс и время занятий</p>
                
                {error && <div style={errorStyle}>{error}</div>}
                
                <form onSubmit={handleSubmit}>
                    {/* Выбор предмета */}
                    <label style={labelStyle}>Предмет:</label>
                    <select 
                        value={selectedCourse}
                        onChange={(e) => setSelectedCourse(parseInt(e.target.value))}
                        required
                        style={inputStyle}
                    >
                        {courses.map(course => (
                            <option key={course.id} value={course.id}>
                                {course.name}
                            </option>
                        ))}
                    </select>
                    
                    {/* Активное время */}
                    <label style={labelStyle}>Активное время занятий (в секундах):</label>
                    <input
                        type="number"
                        placeholder="Например: 3600 (1 час)"
                        value={activeTime}
                        onChange={(e) => setActiveTime(parseInt(e.target.value) || 0)}
                        required
                        style={inputStyle}
                    />
                    <small style={hintStyle}>В секундах: 60 = 1 минута, 3600 = 1 час</small>
                    
                    {/* Класс */}
                    <label style={labelStyle}>Класс:</label>
                    <select 
                        value={classNumber}
                        onChange={(e) => setClassNumber(e.target.value)}
                        required
                        style={inputStyle}
                    >
                        <option value="7">7 класс</option>
                        <option value="8">8 класс</option>
                        <option value="9">9 класс</option>
                        <option value="10">10 класс</option>
                        <option value="11">11 класс</option>
                    </select>
                    
                    {/* Дедлайн */}
                    <label style={labelStyle}>Дедлайн:</label>
                    <input
                        type="datetime-local"
                        value={deadline}
                        onChange={(e) => setDeadline(e.target.value)}
                        required
                        style={inputStyle}
                    />
                    
                    <button type="submit" disabled={loading} style={buttonStyle}>
                        {loading ? 'Сохранение...' : 'Сохранить и продолжить'}
                    </button>
                </form>
            </div>
        </div>
    );
}

const containerStyle = { display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '100vh', backgroundColor: '#f5f5f5' };
const formContainerStyle = { backgroundColor: 'white', padding: '40px', borderRadius: '8px', boxShadow: '0 2px 4px rgba(0,0,0,0.1)', width: '100%', maxWidth: '500px' };
const titleStyle = { textAlign: 'center' as const, marginBottom: '10px', color: '#333' };
const subtitleStyle = { textAlign: 'center' as const, marginBottom: '30px', color: '#666', fontSize: '14px' };
const labelStyle = { display: 'block', marginBottom: '5px', fontWeight: 'bold', color: '#555' };
const inputStyle = { width: '100%', padding: '12px', marginBottom: '15px', border: '1px solid #ddd', borderRadius: '4px', fontSize: '16px', boxSizing: 'border-box' as const };
const hintStyle = { display: 'block', marginTop: '-10px', marginBottom: '15px', fontSize: '12px', color: '#999' };
const buttonStyle = { width: '100%', padding: '12px', backgroundColor: '#28a745', color: 'white', border: 'none', borderRadius: '4px', fontSize: '16px', cursor: 'pointer', marginTop: '10px' };
const errorStyle = { color: 'red', marginBottom: '15px', padding: '10px', backgroundColor: '#ffeeee', borderRadius: '4px', textAlign: 'center' as const };