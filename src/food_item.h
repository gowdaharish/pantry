#pragma once

#include <QObject>
#include <QString>

class FoodItem
{
public:
    FoodItem(const QString& name, const QString& expiryDays);

    QString name() const {return _name;}
    void setName(const QString& name) {_name = name;}
    QString expiryDays() const {return _expiryDays;}
    void setExpiryDays(const QString& exp) {_expiryDays = exp;}

private:
    QString _name;
    QString _expiryDays;
};
