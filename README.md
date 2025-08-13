# Rift Analytics Nexus 🎮
# League of Legends Data Analysis System 

[![GitHub](https://img.shields.io/badge/GitHub-Jackson-blue)](https://github.com/Jackksonns)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Database](https://img.shields.io/badge/Database-MySQL-orange)](https://www.mysql.com/)

## Project Highlights

- **Comprehensive Data Analysis**: Transform raw game data into actionable insights
- **Advanced Analytics**: Track champion performance, item builds, and player statistics
- **Real-time Match Tracking**: Monitor live game data and historical match records
- **Professional Insights**: Support both casual players and professional analysts
- **Optimized Performance**: Efficient database design with optimized queries

## Project Introduction
This is a sophisticated data analysis system based on League of Legends game data. It provides a powerful platform for storing, analyzing, and visualizing various game elements including champion information, item data, match records, and player statistics. The system is designed to help both players and data analysts better understand game trends and make data-driven decisions.

## Project Structure
```
.
├── README.md                           # Project documentation
├── lol_database.sql                    # Database structure and initial data
├── lol-data.xml                        # Database XML export file
├── conceptual design.drawio            # Database conceptual design diagram
├── conceptual design.pdf               # Database conceptual design PDF version
├── Xuery for 3 tasks.docx              # Query task documentation
└── xquery results(screenshots)/        # Query results screenshots directory
```

## Database Structure
The database features a well-designed schema with the following key components:

1. **champion (Champion Table)**
   - Comprehensive champion information storage
   - Advanced metrics: Champion ID, name, role type, base health, base attack damage
   - Role-based categorization for easy filtering

2. **item (Item Table)**
   - Detailed item information management
   - Rich attributes: Item ID, name, cost, attack damage, ability power, passive effects
   - Support for complex item interactions

3. **itembuild (Item Build Table)**
   - Smart item combination schemes
   - Version-specific builds with effectiveness ratings
   - Optimized build order recommendations

4. **match (Match Table)**
   - Complete match data tracking
   - Real-time game statistics
   - Version control and game mode tracking

5. **player (Player Table)**
   - Extensive player profile management
   - Performance tracking and ranking system
   - Historical data analysis capabilities

6. **team (Team Table)**
   - Team composition analysis
   - Strategic formation tracking
   - Side-specific statistics

7. **skin (Skin Table)**
   - Comprehensive skin collection management
   - Rarity and level tracking
   - Champion-skin relationship mapping

## Advanced Analytics Views
The system includes powerful analytical views for deep insights:

1. **champion_combinations**
   - Advanced champion synergy analysis
   - Popular combination tracking
   - Win rate correlation studies

2. **itembuildpopularity**
   - Real-time build popularity tracking
   - Meta analysis and trends
   - Performance correlation studies

3. **playerchampionstats**
   - Detailed player performance metrics
   - Champion mastery tracking
   - Historical performance analysis

## 🚀 Key Features
1. **Data-Driven Insights**
   - Complete League of Legends game data storage
   - Advanced analytics and reporting
   - Custom query support

2. **Build Optimization**
   - Smart item build analysis
   - Meta trend tracking
   - Performance optimization suggestions

3. **Player Analytics**
   - Comprehensive player statistics
   - Performance tracking
   - Historical data analysis

4. **Match Analysis**
   - Detailed match data tracking
   - Real-time statistics
   - Historical match analysis

5. **Champion Analytics**
   - Advanced champion combination analysis
   - Win rate correlation studies
   - Meta trend tracking

## 🛠Usage Instructions
1. **Setup**
   - Import `lol_database.sql` using MySQL
   - Configure database connection
   - Initialize required tables

2. **Analysis**
   - View `conceptual design.pdf` for database architecture
   - Follow `Xuery for 3 tasks.docx` for query examples
   - Check `xquery results(screenshots)/` for sample outputs

## Tech Stack
- **Database**: MySQL (Optimized for performance)
- **Design Tool**: Draw.io (Professional diagramming)
- **Documentation**: Markdown, PDF, DOCX

## Technical Specifications
1. **Performance Optimized**
   - UTF-8 encoding for international support
   - InnoDB engine for transaction support
   - Optimized query performance

2. **Data Integrity**
   - Complete foreign key constraints
   - Referential integrity enforcement
   - Data validation rules

3. **Query Optimization**
   - Materialized views for common queries
   - Index optimization
   - Query performance monitoring

## Maintenance Guidelines
1. **Regular Maintenance**
   - Automated database backups
   - Performance monitoring
   - Query optimization

2. **Version Control**
   - Game version synchronization
   - Data structure updates
   - Compatibility maintenance

3. **Data Management**
   - Regular data validation
   - Consistency checks
   - Performance optimization

## 👨‍💻 Author
- GitHub: [@Jackksonns](https://github.com/Jackksonns)
- with other two students (They're coming soon...)

## ⭐ Show your support

Give a ⭐️ if this project helped you! 
