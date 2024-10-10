const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors')
const path = require('path');
const app = express();
const port = 3000;

app.use(cors())
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json())


app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use('/member_upload', express.static(path.join(__dirname, 'member_upload')));
app.use('/upload', express.static(path.join(__dirname, 'upload')));


const testRoutes = require('./routes/test');
app.use('/api/test', testRoutes);

//web
const authRoutes = require('./routes/auth');
app.use('/api/auth', authRoutes);
const userRoutes = require('./routes/user');
app.use('/api/user', userRoutes);
const toolRoutes = require('./routes/tool')
app.use('/api/tool', toolRoutes);
const symptomRoutes = require('./routes/symptom');
app.use('/api/symptom', symptomRoutes);
const caseRoutes = require('./routes/case');
app.use('/api/caseRoutes', caseRoutes);
const hospitalRoutes = require('./routes/hospital');
app.use('/api/hospitalRoutes', hospitalRoutes);
const exacerbationRoutes = require('./routes/exacerbation');
app.use('/api/exacerbation', exacerbationRoutes);
const non_emergancyRoutes = require('./routes/non_emergancy');
app.use('/api/non_emergancy', non_emergancyRoutes);


//app 
const member = require('./routes/app/member')
app.use('/api-app/member', member)
const symptomRoutesApp = require('./routes/app/symptom');
app.use('/api-app/symptom', symptomRoutesApp)
const caseRoutesApp = require('./routes/app/case');
app.use('/api-app/case', caseRoutesApp)
const infectiousPatientsRoutesApp = require('./routes/app/infectiousPatients');
app.use('/api-app/infectious', infectiousPatientsRoutesApp)
const exacerbationRoutesApp = require('./routes/app/exacerbation');
app.use('/api-app/exacerbation', exacerbationRoutesApp)
const nonEmergencyRoutesApp = require('./routes/app/nonEmergency');
app.use('/api-app/non-emergency', nonEmergencyRoutesApp)
const hospitalRoutesApp = require('./routes/app/hospital');
app.use('/api-app/hospital', hospitalRoutesApp)
// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});